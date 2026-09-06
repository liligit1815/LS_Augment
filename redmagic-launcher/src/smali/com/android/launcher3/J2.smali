.class public final synthetic Lcom/android/launcher3/J2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/M2;

.field public final synthetic h:Ljava/lang/Runnable;

.field public final synthetic i:Lu2/s$a;

.field public final synthetic j:I

.field public final synthetic k:[Landroid/view/RemoteAnimationTarget;

.field public final synthetic l:[Landroid/view/RemoteAnimationTarget;

.field public final synthetic m:[Landroid/view/RemoteAnimationTarget;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/M2;Ljava/lang/Runnable;Lu2/s$a;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/J2;->g:Lcom/android/launcher3/M2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/J2;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/J2;->i:Lu2/s$a;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/J2;->j:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/J2;->k:[Landroid/view/RemoteAnimationTarget;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/J2;->l:[Landroid/view/RemoteAnimationTarget;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/launcher3/J2;->m:[Landroid/view/RemoteAnimationTarget;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/J2;->g:Lcom/android/launcher3/M2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/J2;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/J2;->i:Lu2/s$a;

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/J2;->j:I

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/launcher3/J2;->k:[Landroid/view/RemoteAnimationTarget;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/J2;->l:[Landroid/view/RemoteAnimationTarget;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/launcher3/J2;->m:[Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/M2;->D2(Lcom/android/launcher3/M2;Ljava/lang/Runnable;Lu2/s$a;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
