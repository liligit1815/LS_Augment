.class public final synthetic Lcom/android/launcher3/touch/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/touch/d;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/touch/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/touch/a;->g:Lcom/android/launcher3/touch/d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/a;->g:Lcom/android/launcher3/touch/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/touch/d;->clearState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
