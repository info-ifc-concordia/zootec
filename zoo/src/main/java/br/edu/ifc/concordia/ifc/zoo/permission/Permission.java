package br.edu.ifc.concordia.ifc.zoo.permission;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)

/* @interface wtf?? */

public @interface Permission {

	UserRoles value() default UserRoles.NORMAL;
}
