.class Lcom/android/launcher3/widget/CustomTransformSheet$a;
.super Ljava/lang/Object;
.source "CustomTransformSheet.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/CustomTransformSheet;->f1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/CustomTransformSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/CustomTransformSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$a;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/CustomTransformSheet$a;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/CustomTransformSheet;->handleClose(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
