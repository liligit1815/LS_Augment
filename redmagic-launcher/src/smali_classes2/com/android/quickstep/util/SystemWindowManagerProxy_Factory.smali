.class public final Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;
.super Ljava/lang/Object;
.source "SystemWindowManagerProxy_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/util/SystemWindowManagerProxy;",
        ">;"
    }
.end annotation


# instance fields
.field private final desktopVisibilityControllerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "LP1/k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "LP1/k;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;->desktopVisibilityControllerProvider:Lg4/a;

    .line 5
    .line 6
    return-void
.end method

.method public static create(Lg4/a;)Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "LP1/k;",
            ">;)",
            "Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;-><init>(Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static newInstance(LP1/k;)Lcom/android/quickstep/util/SystemWindowManagerProxy;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SystemWindowManagerProxy;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/SystemWindowManagerProxy;-><init>(LP1/k;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/util/SystemWindowManagerProxy;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;->desktopVisibilityControllerProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LP1/k;

    invoke-static {p0}, Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;->newInstance(LP1/k;)Lcom/android/quickstep/util/SystemWindowManagerProxy;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/SystemWindowManagerProxy_Factory;->get()Lcom/android/quickstep/util/SystemWindowManagerProxy;

    move-result-object p0

    return-object p0
.end method
