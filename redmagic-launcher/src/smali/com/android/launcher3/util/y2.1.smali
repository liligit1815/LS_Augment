.class public final Lcom/android/launcher3/util/y2;
.super Ljava/lang/Object;
.source "SplitConfigurationOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/y2$c;,
        Lcom/android/launcher3/util/y2$d;,
        Lcom/android/launcher3/util/y2$a;,
        Lcom/android/launcher3/util/y2$b;
    }
.end annotation


# direct methods
.method public static a(I)Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->L2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->K2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 7
    .line 8
    return-object p0
.end method

.method public static b(I)I
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_1
    const/4 p0, 0x0

    .line 10
    return p0
.end method
