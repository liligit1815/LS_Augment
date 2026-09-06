.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$h;
.super Ljava/lang/Object;
.source "AIFutureWidgetUtils.java"

# interfaces
.implements Lcom/android/launcher3/util/Y0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->Y(Lcom/android/launcher3/C2;Ljava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$h;->a:Z

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p2, Lcom/android/launcher3/widget/custom/future/d;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/widget/custom/future/d;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/widget/custom/future/d;->getAIFutureWidgetLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$h;->a:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method
