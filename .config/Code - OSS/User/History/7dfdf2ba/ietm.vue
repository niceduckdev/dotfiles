<script setup>
import { RouterLink } from 'vue-router';

defineProps({
    href: String
});

const styles = "font-bold text-slate-500 hover:text-slate-600 underline transition-colors duration-75 select-none cursor-pointer";
</script>

<template>
    <a :href="href" :class="styles" target="_blank" v-if="href.startsWith('https://') || external">
        <slot />
    </a>
    <RouterLink :class="styles" :to="href" v-else>
        <slot />
    </RouterLink>
</template>