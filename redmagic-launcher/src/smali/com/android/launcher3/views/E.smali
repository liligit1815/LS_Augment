.class public final synthetic Lcom/android/launcher3/views/E;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:J

.field public final synthetic h:Lcom/android/launcher3/C2;

.field public final synthetic i:Landroid/view/View;

.field public final synthetic j:Lcom/android/launcher3/model/data/y;

.field public final synthetic k:Landroid/graphics/RectF;

.field public final synthetic l:Ls1/o;

.field public final synthetic m:Lcom/android/launcher3/views/FloatingIconView$b;


# direct methods
.method public synthetic constructor <init>(JLcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/graphics/RectF;Ls1/o;Lcom/android/launcher3/views/FloatingIconView$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/android/launcher3/views/E;->g:J

    .line 5
    .line 6
    iput-object p3, p0, Lcom/android/launcher3/views/E;->h:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/android/launcher3/views/E;->i:Landroid/view/View;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/android/launcher3/views/E;->j:Lcom/android/launcher3/model/data/y;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/android/launcher3/views/E;->k:Landroid/graphics/RectF;

    .line 13
    .line 14
    iput-object p7, p0, Lcom/android/launcher3/views/E;->l:Ls1/o;

    .line 15
    .line 16
    iput-object p8, p0, Lcom/android/launcher3/views/E;->m:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/views/E;->g:J

    .line 2
    .line 3
    iget-object v2, p0, Lcom/android/launcher3/views/E;->h:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/android/launcher3/views/E;->i:Landroid/view/View;

    .line 6
    .line 7
    iget-object v4, p0, Lcom/android/launcher3/views/E;->j:Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    iget-object v5, p0, Lcom/android/launcher3/views/E;->k:Landroid/graphics/RectF;

    .line 10
    .line 11
    iget-object v6, p0, Lcom/android/launcher3/views/E;->l:Ls1/o;

    .line 12
    .line 13
    iget-object v7, p0, Lcom/android/launcher3/views/E;->m:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 14
    .line 15
    invoke-static/range {v0 .. v7}, Lcom/android/launcher3/views/FloatingIconView;->d(JLcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/graphics/RectF;Ls1/o;Lcom/android/launcher3/views/FloatingIconView$b;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
