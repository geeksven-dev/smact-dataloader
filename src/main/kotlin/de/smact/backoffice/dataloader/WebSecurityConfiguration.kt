package de.smact.backoffice.dataloader

import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.web.cors.CorsConfiguration

@Configuration
class WebSecurityConfiguration : WebSecurityConfigurerAdapter() {

    override fun configure(http: HttpSecurity) = configure(http) {
        csrf().disable()
            .cors().configurationSource { CorsConfiguration().applyPermitDefaultValues() }
        authorizeRequests()
                .antMatchers("/**").permitAll()
    }
}
