.class public final synthetic Lcom/android/launcher3/l5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/q5;

.field public final synthetic h:I

.field public final synthetic i:Lcom/android/launcher3/anim/C;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/q5;ILcom/android/launcher3/anim/C;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/l5;->g:Lcom/android/launcher3/q5;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/l5;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/l5;->i:Lcom/android/launcher3/anim/C;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onUpdate(Landroid/graphics/RectF;F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/l5;->g:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/l5;->h:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/l5;->i:Lcom/android/launcher3/anim/C;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Lcom/android/launcher3/q5;->f(Lcom/android/launcher3/q5;ILcom/android/launcher3/anim/C;Landroid/graphics/RectF;F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
