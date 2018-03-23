import Vuex from 'vuex'
import * as vt from 'vue-test-utils'
import AppMenuSlider from '@/components/app/AppMenuSlider'
import store from '@/store'

const localVue = vt.createLocalVue()
localVue.use(Vuex)

describe('app/AppMenuSlider.vue', () => {
  it('should render AppMenuSlider contents', () => {
    const wrapper = vt.shallow(AppMenuSlider, {store, localVue})
    const div = wrapper.find('#edge')
    expect(div).not.toBeNull()
  })
})
