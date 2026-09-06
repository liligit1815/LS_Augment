.class public final synthetic Lcom/android/launcher3/statemanager/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/statemanager/d;

.field public final synthetic h:I

.field public final synthetic i:Lcom/android/launcher3/statemanager/a;

.field public final synthetic j:Landroid/animation/Animator$AnimatorListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/statemanager/d;ILcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/statemanager/c;->g:Lcom/android/launcher3/statemanager/d;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/statemanager/c;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/statemanager/c;->i:Lcom/android/launcher3/statemanager/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/statemanager/c;->j:Landroid/animation/Animator$AnimatorListener;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/c;->g:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/statemanager/c;->h:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/statemanager/c;->i:Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/statemanager/c;->j:Landroid/animation/Animator$AnimatorListener;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/statemanager/d;->b(Lcom/android/launcher3/statemanager/d;ILcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
