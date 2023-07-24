<template>
  <div class="travel_planner">
    <Nav></Nav>
    <b-jumbotron bg-variant="secondary" header-level="5" class="pb-0" id="first">

      <template #header>Build Your Own Customized Trip Plan</template>
      <template #lead>
        Create your travel itinerary. Get an idea of what you can do and eat in your destination.
      </template>

      <b-container>
        <validation-observer ref="observer" v-slot="{ handleSubmit }">
          <b-form ref="form" v-if="show" @submit.stop.prevent="handleSubmit(onSubmit)"> <!-- <b-form @submit="onSubmit" @reset="onReset"> -->
            <!-- <b-row align-h="center" class="mt-5" id="row1">
              <b-col md="6">
                <validation-provider name="Home city" :rules="'required'" v-slot="validationContext1">
                  <b-form-select id="input-home" v-model="form.home" size="lg" class="mt-5"
                                 :state="getValidationState(validationContext1)"
                                 aria-describedby="input-home-live-feedback"
                                 data-vv-as="Home">
                    <b-form-select-option :value="null" disabled>-- The place to travel from: --</b-form-select-option>
                    <b-form-select-option value="SYD">Sydney</b-form-select-option>
                    <b-form-select-option value="MEL">Melbourne</b-form-select-option>
                    <b-form-select-option value="BNE">Brisbane</b-form-select-option>

                  </b-form-select>
                  <b-form-invalid-feedback id="input-home-live-feedback">
                    {{ validationContext1.errors[0] }}
                  </b-form-invalid-feedback>
                </validation-provider>
              </b-col>
            </b-row> -->
            <b-row align-h="center" class="mt-5 mb-5">
              <b-col md="6">
                <validation-provider
                    name="Destination"
                    :rules="'required|alpha'"
                    v-slot="validationContext2">
                  <b-form-group label="Where do you want to go?" label-for="input-des" label-size="lg">
                  <b-form-input id="input-des" v-model="form.destination" type="text" size="lg"
                                placeholder="Choose from our top destinations"
                                :state="getValidationState(validationContext2)"
                                aria-describedby="input-des-live-feedback"
                                data-vv-as="Destination">
                  </b-form-input>
                  <b-form-invalid-feedback id="input-des-live-feedback">
                    {{ validationContext2.errors[0] }}
                  </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
            <b-form-group label="When are you planning to travel?" label-for="input-start" label-size="lg">
            <b-row align-h="center">
              <b-col md="6">
                <validation-provider name="Start Date" :rules="'required'" v-slot="validationContext3">
                  
                  <b-form-datepicker id="input-start" v-model="form.startDate" :min="minStart" :max="maxStart"
                                     @context="inputStartDate" locale="en" size="lg" placeholder="Choose Your Start Date" 
                                     :state="getValidationState(validationContext3)"
                                     aria-describedby="input-start-live-feedback"
                                     data-vv-as="Start">
                  </b-form-datepicker>
                  <b-form-invalid-feedback id="input-start-live-feedback">
                    {{ validationContext3.errors[0] }}
                  </b-form-invalid-feedback>
                
                </validation-provider>
              </b-col>
            </b-row>

            <b-icon icon="arrow-down" class="h1 my-3"></b-icon>

            <b-row align-h="center">
              <b-col md="6">
                <validation-provider name="End Date" :rules="'required'" v-slot="validationContext4">
                  <b-form-datepicker id="input-end" v-model="form.endDate" :min="minEnd" :max="maxEnd"
                                     size="lg"  locale="en" placeholder="Choose Your End Date"
                                     class="mb-5"
                                     :state="getValidationState(validationContext4)"
                                     aria-describedby="input-end-live-feedback"
                                     data-vv-as="End">
                  </b-form-datepicker >
                  <b-form-invalid-feedback id="input-end-live-feedback">
                    {{ validationContext4.errors[0] }}
                  </b-form-invalid-feedback>
                </validation-provider>
              </b-col>
            </b-row>
          </b-form-group>
            <b-row align-h="center">
              <b-col md="6">
                <b-form-group label="What is Your Budget?" label-for="input-style" label-size="lg">
                <validation-provider name="Style" :rules="'required'" v-slot="validationContext5">
                  <b-form-select id="input-style" v-model="form.budget" :options="options" size="lg" 
                                 :state="getValidationState(validationContext5)"
                                 aria-describedby="input-style-live-feedback"
                                 data-vv-as="Style">
                  </b-form-select>
                  <b-form-invalid-feedback id="input-style-live-feedback">
                    {{ validationContext5.errors[0] }}
                  </b-form-invalid-feedback>
                </validation-provider>
              </b-form-group>
              </b-col>
            </b-row>
            <b-row align-h="center" class="customise">
              <b-col md="6">
                <b-form-group label="Who do you plan on traveling with: " label-for="input-group" label-size="lg">
                  <b-form-radio-group v-model="form.group"
                  name="radio-inline" id="input-group">
                  <b-form-radio value="1">Solo</b-form-radio>
                  <b-form-radio value="2">Couple</b-form-radio>
                  <b-form-radio value="3">Family</b-form-radio>
                  <b-form-radio value="4">Friends</b-form-radio>
                  </b-form-radio-group>
                </b-form-group>
              </b-col>
            </b-row>

            <div class="customise">
              <b-button type="submit" variant="success " @click="onSubmit" :disabled="storeDisabled" size="lg">Next</b-button>
              <b-button type="reset" variant="success " @click="onReset" :disabled="resetDisabled" size="lg" class="ml-5">Reset</b-button>
            </div>
          </b-form>
        </validation-observer>
        <!-- <b-card class="mt-3" header="Form Data Result">
          <b-button @click="showForm">Show Form</b-button>
          <pre class="m-0">{{ form }}</pre>
        </b-card> -->
      </b-container>



    </b-jumbotron>
    <Footer></Footer>
  </div>
</template>
<script>

// @ is an alias to /src
import Nav from "@/views/HomePage/Nav";
import Footer from "@/views/HomePage/Footer";
import { getToken } from '@/utils/auth';
export default {
  name: 'ChooseView1',
  components: {
    Footer,
    Nav
  },
  computed: {

  },
  data() {
    const now = new Date()
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
    const minStart = new Date(today)
    const minEnd = new Date(today)
    const maxStart = new Date(today)
    maxStart.setMonth(maxStart.getMonth() + 6)
    const maxEnd = new Date(today)
    maxEnd.setMonth(maxStart.getDate() + 7)

    return {
      form: {
        // home: null,
        destination: '',
        startDate: '',
        endDate: '',
        selectedStyle: null,
        group: "1",
        budget: ''
      },
      minStart: minStart,
      minEnd: minEnd,
      maxStart: maxStart,
      maxEnd: maxEnd,
      options: [
        { value: null, text: 'What is Your Budget?' },
        { value: 'lowBudget', text: 'Low ( <= A$2000 )' },
        { value: 'mediumBudget', text: 'Medium ( between A$2000 to A$5000 )' },
        { value: 'highBudget', text: 'High( >= A$5000 )' }
      ],
      show: true,
      storeDisabled: false,
      resetDisabled: false
    }
  },

  created:function() {
    const check = getToken()
      if(check) {
        // this.$router.push('/choose1')
      } else {
        this.$message.error("Please login before planning")
        this.$router.push('/login')
      }
  },
  methods: {
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },

    inputStartDate(ctx) {       //change the end date after start date selection
      if (this.form.startDate) {
        this.minEnd = new Date(ctx.selectedDate.getFullYear(), ctx.selectedDate.getMonth(), ctx.selectedDate.getDate() )
        this.maxEnd =new Date(ctx.selectedDate.getFullYear(), ctx.selectedDate.getMonth(), ctx.selectedDate.getDate() +6)
        this.form.endDate = null
      }
    },

    onSubmit(event) {  // to choose2 page
      if((this.form.destination.toLowerCase() === "sydney") ||
          (this.form.destination.toLowerCase() === "melbourne") ||
          (this.form.destination.toLowerCase() === "brisbane")) {
            this.storeDisabled = true
            console.log("submitted")
            this.$store.dispatch('plan/storeChoose1', this.form).then(() => {
              this.$router.push({ path: '/choose2'})
            }).catch(() => {
              this.storeDisabled = false
            })
      } else {
        if(this.form.destination.length != 0) {
          this.storeDisabled = false
          this.$message.error("This city hasn't been added yet")
        }
      }
    },

    onReset() {
      console.log("resetted")
      this.resetDisabled = true
      // event.preventDefault()

      // Reset our form values
      this.form.destination = ''
      this.form.startDate = ''
      this.form.endDate = ''
      this.form.budget = ''
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.$refs.observer.reset();
        this.show = true
      })
      this.resetDisabled = true;
    }
    // showForm() {
    //   console.log(this.form.destination)
    // }

  },
}
</script>
<style>
.travel_planner {
  background-color: #a9a8a8;
  height: 100%;
}

.jumbotron {
  height: 100%;
}

div#first.jumbotron.pb-0.bg-secondary {
  background-color: #a9a8a8 !important;
  padding: 20px;
  min-height: 800px;
}

div.customise {
  padding: 15px;
}

</style>
