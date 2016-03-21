<div class='container_wrap' id='pre-footer' style="background-color: #eee; padding: 30px 0;">
	<div class='container' id="testimonials-all" >
		<section class="av_textblock_section">
			<div class="avia_textblock " itemprop="text">
		
				<h2 style="text-align: center;">Hear What Our Clients Say About Us</h2>

			</div><!-- avia_textblock -->

		</section><!-- av_textblock_section -->
		<div class="hr hr-default gray-border  avia-builder-el-9  el_after_av_textblock  el_before_av_testimonials "><span class="hr-inner"><span class="hr-inner-style"></span></span></div>
		<div data-autoplay="1" data-interval="5" data-animation="fade" data-hoverpause="1" class="avia-testimonial-wrapper avia-grid-testimonials avia-grid-2-testimonials avia_animate_when_almost_visible  avia_start_animation">
			<section class="avia-testimonial-row">
				<?php

				$args = array(
				                   'post_type' => 'testimonials',
						   						 'orderby' => 'rand',
				                   'posts_per_page' => 2


				                 );

				$query = new WP_Query( $args );

				while ( $query->have_posts() ) : $query->the_post(); ?>

				<div class="avia-testimonial av_one_half flex_column no_margin avia-testimonial-row-1 avia_start_animation">
					<div class="avia-testimonial_inner">
						<div class="avia-testimonial-image"><?php the_post_thumbnail(array(80, 80)); ?></div>
						<div class="avia-testimonial-content">
							<p><?php the_content(); ?></p>
						</div><!-- testimonial-content -->
						<div class="avia-testimonial-meta">
							<div class="avia-testimonial-meta-mini">
								<strong class="avia-testimonial-name" itemprop="name"><?php the_title(); ?></strong>
								<span class="avia-testimonial-subtitle" itemprop="jobTitle"><?php echo get_post_meta(get_the_ID(), 'subtitle', true); ?></span>
							</div><!-- testimonial-meta-mini -->
							</div><!-- testimonial-meta -->
					</div><!-- avia-testimonial_inner -->
				</div><!-- avia-testimonial -->

				<?php endwhile; 
				?>


				</section><!-- avia-testimonial-row -->
			</div><!-- data auto play -->
	</div><!-- container -->
</div><!-- container_wrap -->


