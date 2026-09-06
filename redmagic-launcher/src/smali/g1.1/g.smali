.class public final Lg1/g;
.super Ljava/lang/Object;
.source "StaticObjectModule_ProvideGestureExclusionManagerFactory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lg1/g$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/util/GestureExclusionManager;",
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

.method public static a()Lg1/g;
    .locals 1

    .line 1
    invoke-static {}, Lg1/g$a;->a()Lg1/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static c()Lcom/android/quickstep/util/GestureExclusionManager;
    .locals 1

    .line 1
    invoke-static {}, Lg1/f;->a()Lcom/android/quickstep/util/GestureExclusionManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lf4/e;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/util/GestureExclusionManager;

    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public b()Lcom/android/quickstep/util/GestureExclusionManager;
    .locals 0

    .line 1
    invoke-static {}, Lg1/g;->c()Lcom/android/quickstep/util/GestureExclusionManager;

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
    invoke-virtual {p0}, Lg1/g;->b()Lcom/android/quickstep/util/GestureExclusionManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
