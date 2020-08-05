<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_name' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'nnWV`6vC-p+S+k00.1lSoXp1[#~s.oYHXbHn||XvzUSe|F|/&F#OAe]=d,{Gm8+M');
define('SECURE_AUTH_KEY',  'Dl3awYV,{5[V.%SoSnQ)3QvDnpJQtlY<Q<ZwE-6=c*=*:VXA0^(_){^^&R%*mPd,');
define('LOGGED_IN_KEY',    '(O9wG9HvV1M&ev(MfUF0gxGMd~EAK8-8ZyW:f pwQ:Tbc5V/*.2uq2bRWf!,^X}h');
define('NONCE_KEY',        'zKd2j|i35T[H[$t2/D[6vO#%IIQpjbGWHIbEAu}S}x-R9WuZu|=H6$6IIla8PmC>');
define('AUTH_SALT',        '_-[=IBQ9Ue$~$%hAm+,,@`N }NRtV$Cih!rl16pTiJfPF|C9%% P|~nFM^k=:nS:');
define('SECURE_AUTH_SALT', 'g5M/3k{(1LC/c$im]3G@5Ia~~jytiwKJUI*uhdE<OFC:|+lZ0^_c}^>!Y3YOufRo');
define('LOGGED_IN_SALT',   '$88:1{qSJjp%y&8r0F,92J r{bv)V+{V=q^4dDG1jPm%JXcm~r4,VL+F/DRvBl&F');
define('NONCE_SALT',       '.tF/==O0U^I;flZV6/4;HG|@kpYDcb9_Z9A= AXj{, ,R KA,rwNykL1Ss.JD`62');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
