<template>
    <div class="travel_planner">
        <Nav></Nav>
        <b-jumbotron bg-variant="secondary" header-level="4" class="pb-2">

            <template #header>Which cuisine do you like?</template>
            <template #lead>
                Cuisine Type
            </template>

            <hr>

          <b-container>
            <b-form ref="form">
              <b-row align-h="center" class="mt-2">
                <b-col md="4">
                  <b-card title="Asian" img-src="https://asianinspirations.com.au/wp-content/uploads/2021/03/6-Healthy-Aspects-of-Asian-Cuisines_00-Feat-Img-940x627.jpg" img-alt="Image"
                          img-top tag="article" class="mb-2" img-height="180">
                    <b-form-checkbox v-model="form.asian" ref="asianCheck" @input="selectAsian"
                                     name="styleChoose" button :button-variant="asianVariant">
                      {{asianStyle ? 'Selected' : 'Select'}}
                    </b-form-checkbox>
                  </b-card>
                </b-col>

                <b-col md="4">
                  <b-card title="European" img-src="https://www.lacademie.com/wp-content/uploads/2021/08/confit-de-canard.webp" img-alt="Image"
                          img-top tag="article" class="mb-2" img-height="180">
                    <b-form-checkbox v-model="form.eu" ref="euCheck" @input="selectEu" name="styleChoose"
                                     button :button-variant="euVariant" >
                      {{euStyle ? 'Selected' : 'Select'}}
                    </b-form-checkbox>
                  </b-card>
                </b-col>

                <b-col md="4">
                  <b-card title="Australian" img-src="https://www.myticketstoindia.com.au/wp-content/uploads/2021/07/Aussie-Meat-Pies.jpg" img-alt="Image" img-top
                          tag="article" class="mb-2" img-height="180">
                    <b-form-checkbox v-model="form.au" ref="auCheck" @input="selectAu" name="styleChoose"
                                     button :button-variant="auVariant">
                      {{auStyle ? 'Selected' : 'Select'}}
                    </b-form-checkbox>
                  </b-card>
                </b-col>

                <b-col md="4">
                    <b-card title="Mediterranean" img-src="https://shef.com/homemade-food/wp-content/uploads/lebanese-mezze-middle-eastern-food-scaled-e1662414361114-1500x1000.jpeg"
                            img-alt="Image"
                            img-top tag="article" class="mb-2" img-height="180">
                      <b-form-checkbox v-model="form.me" ref="meCheck" @input="selectMe"
                                       name="styleChoose" button :button-variant="meVariant">
                        {{ meStyle ? 'Selected' : 'Select' }}
                      </b-form-checkbox>
                    </b-card>
                </b-col>

                <b-col md="4">
                    <b-card title="Mexican" img-src="https://res.cloudinary.com/tf-lab/image/upload/w_1920,c_fill,q_auto,f_auto/restaurant/491a3617-ad84-4c8f-b7d5-3e42d4305b25/8bcc6c96-a089-4a78-8288-f41dca77f497.jpg"
                            img-alt="Image"
                            img-top tag="article" class="mb-2" img-height="180">
                      <b-form-checkbox v-model="form.mex" ref="mexCheck" @input="selectMex"
                                       name="styleChoose" button :button-variant="mexVariant">
                        {{ mexStyle ? 'Selected' : 'Select' }}
                      </b-form-checkbox>
                    </b-card>
                </b-col>
              </b-row>

            </b-form>
          </b-container>

            <hr class="my-6">

            <b-button variant="success " href="#" size="lg" class="mt-3 col-2" @click="onSubmit" :disabled="storeDisabled">Next</b-button>

        </b-jumbotron>
        <Footer></Footer>
    </div>
</template>
<script>
// @ is an alias to /src

import Nav from "@/views/HomePage/Nav";
import Footer from "@/views/HomePage/Footer";
export default {
    name: 'ChooseView3',
    components: {
        Footer,
        Nav
    },
    computed: {
        // ...mapGetters([
        //   'name'
        // ])
    },
    data() {
        return {
            form: {
                asian: '',
                eu: '',
                au: '',
                me: '',
                mex: ''

            },
            asianStyle: '',
            euStyle: '',
            auStyle: '',
            meStyle: '',
            mexStyle: '',
            asianVariant: "secondary",
            euVariant: "secondary",
            auVariant: "secondary",
            meVariant: "secondary",
            mexVariant: "secondary",
            storeDisabled: false
        }
    },

    methods: {
        selectAsian() {
            if (this.form.asian) {
                this.asianVariant = "success"
            }
            else {
                this.asianVariant = "secondary"
            }
        },

        selectEu() {
            if (this.form.eu) {
                this.euVariant = "success"
            }
            else {
                this.euVariant = "secondary"
            }
        },

        selectAu() {
            if (this.form.au) {
                this.auVariant = "success"
            }
            else {
                this.auVariant = "secondary"
            }
        },

        selectMe() {
            if (this.form.me) {
                this.meVariant = "success"
            }
            else {
                this.meVariant = "secondary"
            }
        },

        selectMex() {
            if (this.form.mex) {
                this.mexVariant = "success"
            }
            else {
                this.mexVariant = "secondary"
            }
        },

        onSubmit() {

            this.$store.dispatch('plan/storeChoose3', this.form).then(() => {
                this.storeDisabled = true
                this.$router.push({ path: '/home/plan'})

            }).catch(() => {
                this.storeDisabled = false
            })
        }
    },
  created() {




  }
}
</script>
<style>
.travel_planner {
    background-color: #6c757d;
    height: 100%;
}

.jumbotron {
    height: 100%;
}
</style>
