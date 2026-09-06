.class public final Lcom/android/systemui/shared/condition/Monitor_Factory;
.super Ljava/lang/Object;
.source "Monitor_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/systemui/shared/condition/Monitor;",
        ">;"
    }
.end annotation


# instance fields
.field private final executorProvider:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lf4/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/Monitor_Factory;->executorProvider:Lf4/f;

    .line 5
    .line 6
    return-void
.end method

.method public static create(Lf4/f;)Lcom/android/systemui/shared/condition/Monitor_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;)",
            "Lcom/android/systemui/shared/condition/Monitor_Factory;"
        }
    .end annotation

    .line 2
    new-instance v0, Lcom/android/systemui/shared/condition/Monitor_Factory;

    invoke-direct {v0, p0}, Lcom/android/systemui/shared/condition/Monitor_Factory;-><init>(Lf4/f;)V

    return-object v0
.end method

.method public static create(Lg4/a;)Lcom/android/systemui/shared/condition/Monitor_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Ljava/util/concurrent/Executor;",
            ">;)",
            "Lcom/android/systemui/shared/condition/Monitor_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/condition/Monitor_Factory;

    invoke-static {p0}, Lf4/g;->a(Lg4/a;)Lf4/f;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/android/systemui/shared/condition/Monitor_Factory;-><init>(Lf4/f;)V

    return-object v0
.end method

.method public static newInstance(Ljava/util/concurrent/Executor;)Lcom/android/systemui/shared/condition/Monitor;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/systemui/shared/condition/Monitor;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/condition/Monitor;-><init>(Ljava/util/concurrent/Executor;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/systemui/shared/condition/Monitor;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Monitor_Factory;->executorProvider:Lf4/f;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Executor;

    invoke-static {p0}, Lcom/android/systemui/shared/condition/Monitor_Factory;->newInstance(Ljava/util/concurrent/Executor;)Lcom/android/systemui/shared/condition/Monitor;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Monitor_Factory;->get()Lcom/android/systemui/shared/condition/Monitor;

    move-result-object p0

    return-object p0
.end method
