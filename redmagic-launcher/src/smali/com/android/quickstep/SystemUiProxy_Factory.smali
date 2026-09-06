.class public final Lcom/android/quickstep/SystemUiProxy_Factory;
.super Ljava/lang/Object;
.source "SystemUiProxy_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/SystemUiProxy;",
        ">;"
    }
.end annotation


# instance fields
.field private final contextProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
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
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy_Factory;->contextProvider:Lg4/a;

    .line 5
    .line 6
    return-void
.end method

.method public static create(Lg4/a;)Lcom/android/quickstep/SystemUiProxy_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;)",
            "Lcom/android/quickstep/SystemUiProxy_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/SystemUiProxy_Factory;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/SystemUiProxy_Factory;-><init>(Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/android/quickstep/SystemUiProxy;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/SystemUiProxy;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/SystemUiProxy;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy_Factory;->contextProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lcom/android/quickstep/SystemUiProxy_Factory;->newInstance(Landroid/content/Context;)Lcom/android/quickstep/SystemUiProxy;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy_Factory;->get()Lcom/android/quickstep/SystemUiProxy;

    move-result-object p0

    return-object p0
.end method
