.class public final Lcom/android/quickstep/util/ExternalDisplaysKt;
.super Ljava/lang/Object;
.source "ExternalDisplays.kt"


# direct methods
.method public static final getSafeDisplayId(Landroid/app/TaskInfo;)I
    .locals 0

    if-eqz p0, :cond_0

    .line 4
    iget p0, p0, Landroid/app/TaskInfo;->displayId:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Ljava/lang/Integer;)I

    move-result p0

    return p0
.end method

.method public static final getSafeDisplayId(Lcom/android/systemui/shared/recents/model/Task;)I
    .locals 0

    if-eqz p0, :cond_0

    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    if-eqz p0, :cond_0

    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->displayId:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Ljava/lang/Integer;)I

    move-result p0

    return p0
.end method

.method public static final getSafeDisplayId(Ljava/lang/Integer;)I
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    const/4 v1, -0x1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_1

    return v0

    .line 2
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static final isExternalDisplay(I)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final isExternalDisplay(Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 0

    .line 2
    invoke-static {p0}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Lcom/android/systemui/shared/recents/model/Task;)I

    move-result p0

    invoke-static {p0}, Lcom/android/quickstep/util/ExternalDisplaysKt;->isExternalDisplay(I)Z

    move-result p0

    return p0
.end method
