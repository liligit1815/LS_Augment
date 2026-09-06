.class public Lcom/android/launcher3/X2;
.super Lcom/android/quickstep/util/ContextInitListener;
.source "LauncherInitListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/util/ContextInitListener<",
        "Lcom/android/launcher3/C2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/function/BiPredicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/BiPredicate<",
            "Lcom/android/launcher3/C2;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/ContextInitListener;-><init>(Ljava/util/function/BiPredicate;Lcom/android/launcher3/util/H;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/C2;Z)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->y1()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/util/ContextInitListener;->handleInit(Lcom/android/launcher3/views/k;Z)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public bridge synthetic handleInit(Lcom/android/launcher3/views/k;Z)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/X2;->a(Lcom/android/launcher3/C2;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
