<script setup>
import { RouterLink } from 'vue-router';

const pages = [
    ["Home", "/"],
    ["Over ons", "/over-ons"],
    ["Stamblad", "/stamblad"],
    ["Afdelingen", "/afdelingen"]
];
</script>

<template>
    <nav class="flex flex-col sm:flex-row justify-between items-center mb-2">
        <RouterLink to="/">
            <h1 class="font-extrabold m-0 text-2xl text-slate-900">Chiro Stam</h1>
        </RouterLink>
        <ul class="flex gap-1 items-center flex-wrap">
            <RouterLink v-for="page in pages" :key="page[1]" :to="page[1]">
                {{ page[0] }}
            </RouterLink>
        </ul>
    </nav>
</template>