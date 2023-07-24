<template>
    <div class="travel_planner">
        <Nav></Nav>
        <b-jumbotron bg-variant="secondary" header-level="4" class="pb-2">

            <template #header>Which activities are you interested in?</template>
            <template #lead>
                Activity Type
            </template>

            <hr>

<!--            <b-container>-->
<!--                <b-form ref="form">-->
<!--                <b-row align-h="center" class="mt-2">-->
<!--                    <b-col md="5">-->
<!--                        <b-card title="Attraction" img-src="https://picsum.photos/600/300/?image=25" img-alt="Image"-->
<!--                            img-top tag="article" class="mb-2">-->
<!--                            <b-form-checkbox v-model="form.attraction" ref="advCheck" @input="selectAdv"-->
<!--                                name="styleChoose" button :button-variant="advVariant">-->
<!--                                {{attractionStyle ? 'Selected' : 'Select'}}-->
<!--                            </b-form-checkbox>-->
<!--                        </b-card>-->
<!--                    </b-col>-->

<!--                    <b-col md="5">-->
<!--                        <b-card title="Activity" img-src="https://picsum.photos/600/300/?image=25" img-alt="Image"-->
<!--                            img-top tag="article" class="mb-2">-->
<!--                            <b-form-checkbox v-model="form.activity" ref="culCheck" @input="selectCul" name="styleChoose"-->
<!--                                button :button-variant="culVariant">-->
<!--                                {{activityStyle ? 'Selected' : 'Select'}}-->
<!--                            </b-form-checkbox>-->
<!--                        </b-card>-->
<!--                    </b-col>-->
<!--                </b-row>-->

<!--                <b-row align-h="center" class="mt-4">-->
<!--                    <b-col md="5">-->
<!--                        <b-card title="Food N Drink" img-src="https://picsum.photos/600/300/?image=25" img-alt="Image" img-top-->
<!--                            tag="article" class="mb-2">-->
<!--                            <b-form-checkbox v-model="form.food" ref="urbCheck" @input="selectUrb" name="styleChoose"-->
<!--                                button :button-variant="urbVariant">-->
<!--                                {{foodStyle ? 'Selected' : 'Select'}}-->
<!--                            </b-form-checkbox>-->
<!--                        </b-card>-->
<!--                    </b-col>-->

<!--                    <b-col md="5">-->
<!--                        <b-card title="Water Sport" img-src="https://picsum.photos/600/300/?image=25" img-alt="Image"-->
<!--                            img-top tag="article" class="mb-2">-->
<!--                            <b-form-checkbox v-model="form.water" ref="counCheck" @input="selectCoun"-->
<!--                                name="styleChoose" button :button-variant="counVariant">-->
<!--                                {{waterStyle ? 'Selected' : 'Select'}}-->
<!--                            </b-form-checkbox>-->
<!--                        </b-card>-->
<!--                    </b-col>-->
<!--                </b-row>-->

<!--                </b-form>-->
<!--            </b-container>-->

          <b-container>
            <b-form ref="form">
              <b-row align-h="center" class="mt-2">
                <b-col md="4">
                  <b-card title="Sightseing" img-src="https://assets.atdw-online.com.au/images/be4ddfe20b7088a1b98c4cb418590e7b.jpeg?rect=165%2C0%2C2671%2C2003&w=745&h=559&&rot=360&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjU2YjIzZjkwYjA0MjM4NjI0NWQ0N2NkMiIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9" img-alt="Image"
                          img-top tag="article" class="mb-2" img-height="180">
                    <b-form-checkbox v-model="form.sightseeing" ref="advCheck" @input="selectAdv"
                                     name="styleChoose" button :button-variant="advVariant">
                      {{sightseeingStyle ? 'Selected' : 'Select'}}
                    </b-form-checkbox>
                  </b-card>
                </b-col>

                <b-col md="4">
                  <b-card title="Art/Culture" img-src="https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/52/1b.jpg" img-alt="Image"
                          img-top tag="article" class="mb-2" img-height="180">
                    <b-form-checkbox v-model="form.cul" ref="culCheck" @input="selectCul" name="styleChoose"
                                     button :button-variant="culVariant" >
                      {{cultureStyle ? 'Selected' : 'Select'}}
                    </b-form-checkbox>
                  </b-card>
                </b-col>

                <b-col md="4">
                  <b-card title="Nightlife" img-src="https://media.timeout.com/images/103752936/1920/1080/image.jpg" img-alt="Image" img-top
                          tag="article" class="mb-2" img-height="180">
                    <b-form-checkbox v-model="form.nightlife" ref="urbCheck" @input="selectUrb" name="styleChoose"
                                     button :button-variant="urbVariant">
                      {{nightlifeStyle ? 'Selected' : 'Select'}}
                    </b-form-checkbox>
                  </b-card>
                </b-col>

                <b-col md="4">
                    <b-card title="Water Sports" img-src="https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/b8/40/e0.jpg"
                            img-alt="Image"
                            img-top tag="article" class="mb-2" img-height="180">
                      <b-form-checkbox v-model="form.water" ref="counCheck" @input="selectCoun"
                                       name="styleChoose" button :button-variant="counVariant">
                        {{ waterStyle ? 'Selected' : 'Select' }}
                      </b-form-checkbox>
                    </b-card>
                </b-col>

                <b-col md="4">
                    <b-card title="Shopping" img-src="https://cdn.concreteplayground.com/content/uploads/2019/08/strand-arcade-sydney-cbd-destination-nsw-1920x1080.jpeg"
                            img-alt="Image"
                            img-top tag="article" class="mb-2" img-height="180">
                      <b-form-checkbox v-model="form.shop" ref="shopCheck" @input="selectShop"
                                       name="styleChoose" button :button-variant="shopVariant">
                        {{ shopStyle ? 'Selected' : 'Select' }}
                      </b-form-checkbox>
                    </b-card>
                </b-col>
              </b-row>

<!--              <b-row align-h="center" class="mt-4">-->
<!--                -->

<!--                <b-col md="5">-->
<!--                  <b-card title="Water Sport" img-src="https://picsum.photos/600/300/?image=25" img-alt="Image"-->
<!--                          img-top tag="article" class="mb-2">-->
<!--                    <b-form-checkbox v-model="form.water" ref="counCheck" @input="selectCoun"-->
<!--                                     name="styleChoose" button :button-variant="counVariant">-->
<!--                      {{waterStyle ? 'Selected' : 'Select'}}-->
<!--                    </b-form-checkbox>-->
<!--                  </b-card>-->
<!--                </b-col>-->
<!--              </b-row>-->

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
    name: 'ChooseView2',
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
                sightseeing: '',
                cul: '',
                nightlife: '',
                water: '',
                shop: ''


            },
            sightseeingStyle: '',
            cultureStyle: '',
            nightlifeStyle: '',
            waterStyle: '',
            shopStyle: '',
            advVariant: "secondary",
            culVariant: "secondary",
            urbVariant: "secondary",
            counVariant: "secondary",
            shopVariant: "secondary",
            storeDisabled: false
        }
    },

    methods: {
        selectAdv() {
            if (this.form.sightseeing) {
                this.advVariant = "success"
            }
            else {
                this.advVariant = "secondary"
            }
        },

        selectCul() {
            if (this.form.cul) {
                this.culVariant = "success"
            }
            else {
                this.culVariant = "secondary"
            }
        },

        selectUrb() {
            if (this.form.nightlife) {
                this.urbVariant = "success"
            }
            else {
                this.urbVariant = "secondary"
            }
        },

        selectCoun() {
            if (this.form.water) {
                this.counVariant = "success"
            }
            else {
                this.counVariant = "secondary"
            }
        },

        selectShop() {
            if (this.form.shop) {
                this.shopVariant = "success"
            }
            else {
                this.shopVariant = "secondary"
            }
        },

        onSubmit() {

            this.$store.dispatch('plan/storeChoose2', this.form).then(() => {
                this.storeDisabled = true
                this.$router.push({ path: '/choose3'}) //REPLACE: this.$router.push({ path: '/choose3'})

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
