.class Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;
.super Ljava/lang/Object;
.source "AICustomWidgetNoticeCardView.java"

# interfaces
.implements Lcom/android/launcher3/widget/custom/ai/r$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/widget/custom/ai/r$a<",
        "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->b()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const p2, 0x7f0b0096

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Landroid/widget/ImageView;

    .line 22
    .line 23
    const v0, 0x7f0b0098

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    const v1, 0x7f0b0097

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Landroid/widget/TextView;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->title:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->summary:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    sget-object p1, Lcom/android/launcher3/widget/custom/ai/n;->J:Ljava/util/HashMap;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->pkg:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->pkg:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const/4 p0, 0x0

    .line 75
    :goto_0
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public b()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->f(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->d(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d(Landroid/view/ViewGroup;Ljava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->f(Landroid/view/ViewGroup;Ljava/lang/Integer;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e(I)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public f(Landroid/view/ViewGroup;Ljava/lang/Integer;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v1, 0x0

    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const v0, 0x7f0e0044

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const v0, 0x7f0e0045

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :goto_0
    new-instance p2, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a$a;

    .line 45
    .line 46
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a$a;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-object p1
.end method

.method public bridge synthetic getItemViewType(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;->e(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
