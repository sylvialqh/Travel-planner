<template>
  <div>
    <div class="planbody">
      <b-row v-for="j in rowbutlast">
        <b-col v-for="i in colbutlast">
          <div>
            <h5><b>Day {{ (j - 1) * 3 + i }} - {{ des }}</b></h5>
            <p class="mx-0"> {{ displayDate((j - 1) * 3 + i - 1) }}</p>
          </div>
          <!--          <b-card v-for="th in things_todo" :key="th.id" :img-src="th.img" img-alt="Card image" img-left class="mb-3"-->
          <!--                  img-width="50%" >-->
          <!--            <b-card-body :title="th.name" title-tag="b" class="card_body">-->
          <!--              <b-card-text>-->
          <!--                {{ th.address }}-->
          <!--                <p><b>Price: </b>{{ th.price }}$</p>-->
          <!--                            <b>Type: </b>{{ th.type }}-->
          <!--              </b-card-text>-->
          <!--            </b-card-body>-->
          <!--          </b-card>-->
          <b-card v-for="th in plan[(j - 1) * 3 + i]" :key="th.id" :img-src="th.img" img-alt="Card image" img-left
                  class="mb-3"
                  img-width="50%" style="height: 250px">
            <b-card-body :title="th.name" title-tag="b" class="card_body">
              <b-card-text>
                {{ th.address }}
                <p><b v-if="th.price_level">Price level: </b>{{ th.price_level }}</p>
                <p><b v-if="th.type">Type: </b>{{ th.type }}</p>
                <p><b v-if="th.rating">Rating: </b>{{ th.rating }}</p>
              </b-card-text>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
      <b-row cols="3" v-if="collast!=0">
        <b-col v-for="i in collast">
          <div>
            <h5><b>Day {{ rowbutlast * 3 + i }} - {{ des }}</b></h5>
            <p class="mx-0"> {{ displayDate(rowbutlast * 3 + i - 1) }}</p>
          </div>
          <b-card v-for="th in plan[ rowbutlast * 3 + i]" :key="th.id" :img-src="th.img" img-alt="Card image" img-left
                  class="mb-3"
                  img-width="50%" style="height: 250px">
            <b-card-body :title="th.name" title-tag="b" class="card_body">
              <b-card-text>
                {{ th.address }}
                <p><b v-if="th.price_level">Price level: </b>{{ th.price_level }}</p>
                <p><b v-if="th.type">Type: </b>{{ th.type }}</p>
                <p><b v-if="th.rating">Rating: </b>{{ th.rating }}</p>
              </b-card-text>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
      <b-button squared variant="secondary" size="lg" class="col-4 my-2" pill @click="saveToMyPlan">Save the plan
      </b-button>

    </div>

    <!--    <div style="width: 100%;position: fixed;bottom: 0">-->
    <div class="navbar-fixed-bottom">
      <Footer></Footer>
    </div>
    <!--      </div>-->
  </div>


</template>

<script>
import dateFormat from "dateformat";
import Footer from "@/views/HomePage/Footer";
import {savePlan} from "@/api/plan"
const api_key = "AIzaSyD_n7IW6r4yD5ZpWtlUgDyk1sUbeTHA4WU";

export default {
  name: "PlanBodyView",
  components: {
    Footer

  },
  data() {
    return {
      plan: {},
      things_todo: [],
      //home: this.$store.state.plan.home,
      des: this.$store.state.plan.des,
      day: this.$store.state.plan.day,
      budget: this.$store.state.plan.budget,
      startDay: new Date(this.$store.state.plan.startDay),
      endDay: new Date(this.$store.state.plan.endDay),
      rowbutlast: this.$store.state.plan.day <= 3 ? 1 : parseInt(this.$store.state.plan.day / 3),
      colbutlast: this.$store.state.plan.day <= 3 ? this.$store.state.plan.day : 3,
      collast: this.$store.state.plan.day <= 3 ? 0 : parseInt(this.$store.state.plan.day % 3),
      types: this.$store.state.plan.style,
      cuisineTypes: this.$store.state.plan.cuisine,
      // mode: this.$store.state.plan.mode,
      group: this.$store.state.plan.group,
      price: ''
    }
  },
  created() {

    //console.log("Printing current plan in store: " + this.$store.state.plan.plan)

    if(this.$store.state.plan.plan){
      this.plan = JSON.parse(this.$store.state.plan.plan);
      console.log("Printing current plan in store: " + this.plan)
      console.log("print type of saved plan:" + typeof this.plan)
    } 
    else {
      
      const params_reality = {
      startDay: this.formatDate(this.startDay),
      endDay: this.formatDate(this.endDay),
      // home: this.home,
      des: this.des,
      budget: this.budget,
      style: this.types.toString(),
      cuisine: this.cuisineTypes.toString(),
      // mode: this.mode,
      group: this.group,
    }

      this.$store.dispatch('plan/generatePlan', params_reality).then(res => {
        if(res){
          this.plan = res
          console.log("print type of plan:" + typeof this.plan)
          // let price = 0
          // this.price = this.$store.state.plan.price
        }
      }).catch(() => {  })
    }
    
  }, mounted() {

  },
  methods: {
    displayDate(num) {
      let date = new Date(this.startDay)
      date.setDate(date.getDate() + num)
      return dateFormat(date, "fullDate");
    },
    formatDate(date) {
      // console.log(date.toISOString().slice(0, 10))
      return date.toISOString().slice(0, 10);
    },
    saveToMyPlan() {
      const params_saved = {
        start: this.formatDate(this.startDay),
        end: this.formatDate(this.endDay),
        des: this.des,
        plan: JSON.stringify(this.plan),
      }
      savePlan(params_saved).then(res => {
        if(res.code == 20000){
          console.log("success in saving plans!")
        } else{
          console.log(res.message)
        }
      }).catch(() => { 
      })
    }
  }
}
</script>

<style scoped>
.planbody {
  width: 90%;
  margin: 0 auto;
  min-height: 1000px;
  background-color: white;
}

.card_body {
  text-align: left;
  padding: 0;
}


</style>
