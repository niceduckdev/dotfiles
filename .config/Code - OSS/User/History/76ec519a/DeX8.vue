<script setup>
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
        <NavigationTitle />

        <ul className="md:flex hidden gap-1 items-center">
            <NavigationLink v-for="page in pages" :key="page[1]" :href="page[1]">
                {{ page[0] }}
            </NavigationLink>
        </ul>

        <NavigationMenu :pages="pages" />
    </nav>
</template>