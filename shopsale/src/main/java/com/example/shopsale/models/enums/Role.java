package com.example.shopsale.models.enums;

import org.jspecify.annotations.Nullable;
import org.springframework.security.core.GrantedAuthority;

/**
 * @author DMoroz
 **/
public enum Role implements GrantedAuthority {
    ROLE_ADMIN,
    ROLE_USER,
    ;

    @Override
    public @Nullable String getAuthority() {
        return name();
    }
}
