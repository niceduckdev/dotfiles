<script setup>
import { RouterLink } from 'vue-router';

const pages = [
    ["Home", "/"],
    ["Info", "/info"],
    ["Stamblad", "/stamblad"],
    ["Afdelingen", "/afdelingen"],
    ["Contact", "/contact"],
    ["Kalender", "/kalender"],
];
</script>

<template>
    <nav className="flex justify-between items-center mb-2 h-10">
        <RouterLink to="/">
            <h1 class="font-extrabold m-0 text-2xl text-slate-900">Chiro Stam</h1>
        </RouterLink>

        <ul className="md:flex hidden gap-1 items-center">
            <NavigationLink v-for="page in pages" :key="page[1]" :href="page[1]">
                {{ page[0] }}
            </NavigationLink>
        </ul>

        <NavigationMenu :pages="pages" />
    </nav>
</template>