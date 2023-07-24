import axios from 'axios'
import { MessageBox, Message } from 'element-ui'
import store from '@/store'
import { getToken } from '@/utils/auth'
import router from "@/router";

// create an axios instance
// axios.defaults.baseURL = "/api"

const service = axios.create({
  baseURL: '/api', // url = base url + request url
  withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000 // request timeout
})

// 请求白名单，如果请求在白名单里面，将不会被拦截校验权限
const whiteUrls = ["/user/login", '/user/register', '/things/attractionlist']

// request interceptor
service.interceptors.request.use(
  config => {
    // before request is sent
    console.log(config.url) // debug
    if (!whiteUrls.includes(config.url)) { 
      if(!store.getters.token) {
        console.log("debugging request.js: not in white list")
        console.log("debugging request.js: no token in store")
        router.push("/home").catch(error => {
          if (
            error.name !== 'NavigationDuplicated' &&
            !error.message.includes('Avoided redundant navigation to current location')
          ) {
            console.log(error)
          }
        })
      }
      else { // if (store.getters.token)
        // let each request carry token: ['token'] is the customed headers key
        config.headers['token'] = getToken()     
      }
    } 
    console.log(config.params)
    return config
  },
  error => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  /**
   * If you want to get http information such as headers or status
   * Please return  response => response
  */

  /**
   * Determine the request status by custom code
   * Here is just an example
   * You can also judge the status by HTTP Status Code
   */
  response => {
    const res = response.data
    console.log(res.code)
    if (response.status == 200 || response.status == 304 ) {
      return res;
    } else{
      // if the custom code is not 20000, it is judged as an error.
      if (res.code !== 20000) {
        Message({
          message: res.message || 'Error',
          type: 'error',
          duration: 5 * 1000
        })

        // validate token
        if (res.code === 401) {
          console.error("token expired, please re-login")
          // to re-login
          MessageBox.alert('You have been logged out, you can cancel to stay on this page, or log in again', 'Confirm logout', {
            confirmButtonText: 'Re-Login',
            type: 'warning'
          }).then(() => {
            store.dispatch('user/resetToken').then(() => {
            location.reload()
            router.push("/home").catch(error => {  
              if (
                error.name !== 'NavigationDuplicated' &&
                !error.message.includes('Avoided redundant navigation to current location')
              ) {
                console.log(error)
              }
            })
            })
          })
          return Promise.reject(new Error(res.message || 'Error'))
        }
      }
    } 
  },
  error => {
    console.log('err' + error.response.status) // for debug
    // validate token
    if (error.response.status === 401) {
      console.error("token expired, please re-login")
      // to re-login
      MessageBox.alert('You have been logged out, please log in again', 'Confirm logout', {
        confirmButtonText: 'Re-Login',
        type: 'warning'
      }).then(() => {
        store.dispatch('user/resetToken').then(() => {
        // location.reload()
        router.push("/home").catch(error => {  
          if (
            error.name !== 'NavigationDuplicated' &&
            !error.message.includes('Avoided redundant navigation to current location')
          ) {
            console.log(error)
          }
        })
        })
      })
      return Promise.reject(new Error('Error'))
      
    }
    Message({
      message: error.message,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error)
  }
)

export default service
