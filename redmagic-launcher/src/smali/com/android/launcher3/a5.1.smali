.class public final synthetic Lcom/android/launcher3/a5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/q5;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:F

.field public final synthetic j:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/q5;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/a5;->g:Lcom/android/launcher3/q5;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/a5;->h:Landroid/view/View;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/a5;->i:F

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/a5;->j:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/a5;->g:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/a5;->h:Landroid/view/View;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/a5;->i:F

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/a5;->j:F

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/q5;->b(Lcom/android/launcher3/q5;Landroid/view/View;FF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
