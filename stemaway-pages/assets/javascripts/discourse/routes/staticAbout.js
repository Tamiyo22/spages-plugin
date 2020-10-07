import DiscourseURL from 'discourse/lib/url'
import DiscourseRoute from 'discourse/routes/discourse'

export default DiscourseRoute.extend({
  model(opts) {
    return {}
  },

  setupController(controller, model) {
    controller.setProperties({ model })
  }
});
