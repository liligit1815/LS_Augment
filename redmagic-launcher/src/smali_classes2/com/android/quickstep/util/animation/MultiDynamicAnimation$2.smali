.class Lcom/android/quickstep/util/animation/MultiDynamicAnimation$2;
.super Ljava/lang/Object;
.source "MultiDynamicAnimation.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Lcom/android/quickstep/util/animation/SpringHolder;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public accept(Lcom/android/quickstep/util/animation/SpringHolder;)V
    .locals 0

    .line 2
    invoke-static {p1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->start$lambda$0(Lcom/android/quickstep/util/animation/SpringHolder;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/util/animation/SpringHolder;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$2;->accept(Lcom/android/quickstep/util/animation/SpringHolder;)V

    return-void
.end method
