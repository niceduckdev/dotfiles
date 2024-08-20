<script setup>
import { RouterLink } from 'vue-router';

defineProps({
    href: String
});
</script>

<template>
    <a :href="href"
        class="font-bold text-slate-500 hover:text-slate-600 underline transition-colors duration-75 select-none cursor-pointer"
        target="_blank" v-if="href.startsWith('https://') || href.startsWith('mailto:')">
        <slot></slot>
    </a>
    <RouterLink
        class="font-bold text-slate-500 hover:text-slate-600 underline transition-colors duration-75 select-none cursor-pointer"
        :to="href" v-else>
        <slot></slot>
    </RouterLink>
</template>