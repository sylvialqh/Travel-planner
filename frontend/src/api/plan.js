import request from '@/utils/request'

export function generatePlan(params) {
    return request({
        url: '/plan/list',
        method: 'get',
        params,
        timeout: 10000 // Set the timeout for this specific request to 10 seconds
    })
}

export function savePlan(data) {
    return request({
        url: '/plan/save',
        method: 'post',
        data
    })
}

export function getSavedPlan() {
    return request({
        url: '/plan/savedPlan',
        method: 'get',
        timeout: 10000 // Set the timeout for this specific request to 10 seconds
    })
}

export function listAttractions(){
    return request({
        url: "/things/attractionlist",
        method: 'get'
    })
}