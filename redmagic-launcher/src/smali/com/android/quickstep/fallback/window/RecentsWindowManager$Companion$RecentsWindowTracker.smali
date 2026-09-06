.class public final Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;
.super Lcom/android/launcher3/util/H;
.source "RecentsWindowManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RecentsWindowTracker"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/util/H<",
        "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/H;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic isHomeStarted(Lcom/android/launcher3/views/k;)Z
    .locals 0

    .line 2
    check-cast p1, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;->isHomeStarted(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Z

    move-result p0

    return p0
.end method

.method public isHomeStarted(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method
