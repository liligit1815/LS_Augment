.class public final synthetic Lcom/android/launcher3/util/Z2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/b3;

.field public final synthetic h:I

.field public final synthetic i:Landroid/view/LayoutInflater;

.field public final synthetic j:Landroid/os/Handler;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/b3;ILandroid/view/LayoutInflater;Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/Z2;->g:Lcom/android/launcher3/util/b3;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/util/Z2;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/util/Z2;->i:Landroid/view/LayoutInflater;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/util/Z2;->j:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z2;->g:Lcom/android/launcher3/util/b3;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/util/Z2;->h:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/util/Z2;->i:Landroid/view/LayoutInflater;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/util/Z2;->j:Landroid/os/Handler;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/util/b3;->b(Lcom/android/launcher3/util/b3;ILandroid/view/LayoutInflater;Landroid/os/Handler;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
