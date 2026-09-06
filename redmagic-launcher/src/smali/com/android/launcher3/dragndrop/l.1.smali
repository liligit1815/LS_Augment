.class public final synthetic Lcom/android/launcher3/dragndrop/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/TypeEvaluator;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/l;->a:Landroid/view/View;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/dragndrop/l;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/l;->a:Landroid/view/View;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/dragndrop/l;->b:I

    .line 4
    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    check-cast p3, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2, p3}, Lcom/android/launcher3/dragndrop/DragLayer;->c(Landroid/view/View;IFLjava/lang/Float;Ljava/lang/Float;)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
