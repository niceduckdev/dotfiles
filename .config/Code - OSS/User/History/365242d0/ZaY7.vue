<script setup>
defineProps({
    title: String,
    subtitle: String,
});
</script>


<template>
    <article className="flex flex-col gap-1 shadow-md rounded-md px-3 py-4">
        <section class="[&_*]:m-4">
            <h2 className="font-bold text-xl text-red-700">
                {{ title }}
            </h2>
            <h3 className="font-bold text-slate-700">
                {{ subtitle }}
            </h3>
        </section>
        <section class="flex flex-col gap-2">
            <slot />
        </section>
    </article>
</template>