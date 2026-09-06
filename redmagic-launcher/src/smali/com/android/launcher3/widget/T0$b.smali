.class Lcom/android/launcher3/widget/T0$b;
.super Ljava/lang/Object;
.source "WidgetHostViewLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/T0;->a()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/U;

.field final synthetic h:Lcom/android/launcher3/widget/T0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/T0;Lcom/android/launcher3/widget/U;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/T0$b;->g:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 2
    .line 3
    iget v1, v0, Lcom/android/launcher3/widget/T0;->m:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 16
    .line 17
    iget v1, v1, Lcom/android/launcher3/widget/T0;->m:I

    .line 18
    .line 19
    iget-object v3, p0, Lcom/android/launcher3/widget/T0$b;->g:Lcom/android/launcher3/widget/U;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v3}, Lcom/android/launcher3/widget/l0;->v(ILcom/android/launcher3/widget/U;)Landroid/appwidget/AppWidgetHostView;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 26
    .line 27
    iget-object v3, v1, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 28
    .line 29
    iput-object v0, v3, Lcom/android/launcher3/widget/z0;->o:Landroid/appwidget/AppWidgetHostView;

    .line 30
    .line 31
    iput v2, v1, Lcom/android/launcher3/widget/T0;->m:I

    .line 32
    .line 33
    const/4 v1, 0x4

    .line 34
    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetHostView;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/android/launcher3/Workspace;->Z0(Lcom/android/launcher3/model/data/y;)[I

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    aget v4, v1, v3

    .line 57
    .line 58
    const/4 v5, 0x1

    .line 59
    aget v1, v1, v5

    .line 60
    .line 61
    invoke-direct {v2, v4, v1}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    iput v3, v2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 65
    .line 66
    iput v3, v2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 67
    .line 68
    iput-boolean v5, v2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/appwidget/AppWidgetHostView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/android/launcher3/widget/T0$b;->h:Lcom/android/launcher3/widget/T0;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
