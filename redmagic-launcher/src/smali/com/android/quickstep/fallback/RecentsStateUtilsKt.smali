.class public final Lcom/android/quickstep/fallback/RecentsStateUtilsKt;
.super Ljava/lang/Object;
.source "RecentsStateUtils.kt"


# direct methods
.method public static final toLauncherState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/launcher3/V3;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Lcom/android/quickstep/fallback/RecentsState;->ordinal:I

    .line 7
    .line 8
    if-eqz p0, :cond_5

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p0, v0, :cond_4

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p0, v0, :cond_3

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    const-string v1, "NORMAL"

    .line 18
    .line 19
    if-eq p0, v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    if-eq p0, v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x5

    .line 25
    if-eq p0, v0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 28
    .line 29
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 34
    .line 35
    const-string v0, "OVERVIEW_SPLIT_SELECT"

    .line 36
    .line 37
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 42
    .line 43
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 48
    .line 49
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    sget-object p0, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 54
    .line 55
    const-string v0, "BACKGROUND_APP"

    .line 56
    .line 57
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_4
    sget-object p0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 62
    .line 63
    const-string v0, "OVERVIEW_MODAL_TASK"

    .line 64
    .line 65
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_5
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 70
    .line 71
    const-string v0, "OVERVIEW"

    .line 72
    .line 73
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-object p0
.end method

.method public static final toLauncherStateOrdinal(Lcom/android/quickstep/fallback/RecentsState;)I
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/quickstep/fallback/RecentsStateUtilsKt;->toLauncherState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/launcher3/V3;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget p0, p0, Lcom/android/launcher3/V3;->a:I

    .line 11
    .line 12
    return p0
.end method
