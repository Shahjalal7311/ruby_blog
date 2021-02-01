Rails::Application.config.session_store :cookie_store, 
    :key => '_blog_session', 
    :expire_after => 3.minutes