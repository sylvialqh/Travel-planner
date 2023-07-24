import { generatePlan, getSavedPlan } from '@/api/plan'

const getDefaultState = () => {
    return {
        startDay: undefined,
        endDay: undefined,
        //home: '',
        des: '',
        budget: '',
        style: {},
        cuisine: {},
        day:'',
        price:'',
        group:'',
        plan:undefined,
    }
}

const state = getDefaultState()

const mutations = {
    RESET_STATE: (state) => {
        Object.assign(state, getDefaultState())
    },
    
    SET_START: (state, startDay) => {
        state.startDay = startDay
    },
    SET_END: (state, endDay) => {
        state.endDay = endDay
    },
    // SET_HOME: (state, home) => {
    //     state.home = home
    // },
    SET_DES: (state, des) => {
        state.des = des.toLowerCase();
    },
    SET_BUDGET: (state, budget) => {
        state.budget = budget
    },
    SET_STYLE: (state, style) => {
        state.style = style
        // console.log(style[1])
    }
    ,
    SET_CUISINE: (state, cuisine) => {
        state.cuisine = cuisine
        console.log(cuisine[1])
      // DEBUG : type of style: console.log(style[1])
    }
    ,
    SET_DAY: (state, day) => {
        state.day = day
    },
    SET_PRICE: (state, price) => {
        state.price = price
    },
    SET_GROUP: (state, group) => {
        state.group = group
    },
    SET_PLAN: (state, plan) => {
        state.plan = plan
    },
}

const actions = {

    // store user choose 1
    storeChoose1( { commit} , choose) {
        const { home, destination, startDate,endDate,budget,group} = choose
        return new Promise((resolve) => {
            // commit('SET_HOME', home)
            // console.log("DEBUGGING: stored home city is " + state.home)
            commit('SET_DES', destination)
            commit('SET_START', startDate)
            commit('SET_END', endDate)
            commit('SET_BUDGET', budget)
            commit('SET_GROUP', group)
            // console.log(budget)
            commit('SET_DAY', (new Date(endDate)-new Date(startDate))/(24*60*60*1000)+1)
            resolve()
        })
    },

    // store user choose 2
    storeChoose2( { commit}, form) {
        const { sightseeing, cul, nightlife, water, shop} = form;
        const ls = []
        if(sightseeing) { ls[ls.length] = "sightseeing"} // nature
        if(cul) { ls[ls.length] =  "art and culture"}
        if(nightlife) { ls[ls.length] = "nightlife"}
        if(water) { ls[ls.length] = "water sport"} // sport
        if(shop) { ls[ls.length] = "shopping"}
        return new Promise((resolve) => {
            commit('SET_STYLE', ls)
            // DEBUG: console.log(state.style)
            resolve()
        })
    },

    // store user choose 3
    storeChoose3( { commit}, form) {
        const { asian, eu, au, me, mex} = form;
        const ls = []
        if(asian) { ls[ls.length] = "asian"} 
        if(eu) { ls[ls.length] =  "european"}
        if(au) { ls[ls.length] = "nightlife"}
        if(me) { ls[ls.length] = "mediterranean"} 
        if(mex) { ls[ls.length] = "mexican"}
        return new Promise((resolve) => {
            commit('SET_CUISINE', ls)
            // DEBUG: console.log(state.cuisine)
            resolve()
        })
    },

    // generate plan
    generatePlan({ commit }, planParams){
        
        return new Promise((resolve, reject) => {
            generatePlan(planParams).then(res => {
                console.log(res)
                let plan = res
                // for (const resKey in plan) {
                //     for (const resKeyKey in plan[resKey]) {
                //     price += parseInt(plan[resKey][resKeyKey].price)
                //     }
                // }
                commit("SET_PLAN", plan)
                console.log(plan)
                // request succeeded
                resolve(res) // return response data to calling function
            }).catch(error => {
                console.error("Error while generating plan:", error);
                // Request failed, reject the promise with the error
                reject(error);
              });
        })
    },

    // get saved plan
    getSavedPlan({ commit}) {
        console.log("in store's plan module")
        return new Promise((resolve, reject) => {
            getSavedPlan().then(res => {
                // let plan = JSON.parse(res.data.plan);
                let plan = res.data.plan;
                commit("SET_PLAN", plan)

                // set other value
                let destination = res.data.des
                let startDate = res.data.start
                let endDate = res.data.end
                commit('SET_DES', destination)
                commit('SET_START', startDate)
                commit('SET_END', endDate)
                commit('SET_DAY', (new Date(endDate)-new Date(startDate))/(24*60*60*1000)+1)
                
                // request succeeded
                resolve(res) // return response data to calling function
            }).catch(error => {
                console.error("Error while saving plan:", error);
                // Request failed, reject the promise with the error
                reject(error);
              });
        })

    }
}

export default {
    namespaced: true,
    state,
    mutations,
    actions
}
