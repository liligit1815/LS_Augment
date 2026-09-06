.class Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a$a;
.super Ljava/lang/Object;
.source "AICustomWidgetNoticeCardView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->f(Landroid/view/ViewGroup;Ljava/lang/Integer;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;

    .line 14
    .line 15
    invoke-static {p1, p0}, Lcom/android/launcher3/widget/custom/ai/n;->i0(Landroid/view/View;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
