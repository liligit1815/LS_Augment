.class public final synthetic Lcom/android/quickstep/util/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/M2$a;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/e;->g:Lcom/android/launcher3/M2$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/e;->g:Lcom/android/launcher3/M2$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/M2$a;->onAnimationFinished()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
