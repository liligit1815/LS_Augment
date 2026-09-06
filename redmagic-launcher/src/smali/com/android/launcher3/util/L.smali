.class public final Lcom/android/launcher3/util/L;
.super Ljava/lang/Object;
.source "DaggerSingletonTracker_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/L$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/launcher3/util/K;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lcom/android/launcher3/util/L;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/L$a;->a()Lcom/android/launcher3/util/L;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static c()Lcom/android/launcher3/util/K;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/K;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/K;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lcom/android/launcher3/util/K;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/L;->c()Lcom/android/launcher3/util/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/L;->b()Lcom/android/launcher3/util/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
