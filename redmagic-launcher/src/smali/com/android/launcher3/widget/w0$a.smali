.class Lcom/android/launcher3/widget/w0$a;
.super Ljava/lang/Object;
.source "MoreWidgetViewHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/w0;->b(Lcom/android/launcher3/widget/v;Lcom/android/launcher3/widget/C;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/C;

.field final synthetic h:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/w0;Lcom/android/launcher3/widget/C;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/widget/w0$a;->g:Lcom/android/launcher3/widget/C;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/widget/w0$a;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/w0$a;->g:Lcom/android/launcher3/widget/C;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v1, 0x0

    .line 21
    const v2, 0x7f0e008e

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/widget/w0$a;->g:Lcom/android/launcher3/widget/C;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/android/launcher3/widget/C;->j:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->l1(Landroid/view/View;)Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/widget/w0$a;->g:Lcom/android/launcher3/widget/C;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const v1, 0x7f140275

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->setToolBar(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/widget/w0$a;->h:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->g1(Ljava/util/ArrayList;)V

    .line 58
    .line 59
    .line 60
    const/high16 v0, 0x3f800000    # 1.0f

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 63
    .line 64
    .line 65
    const/4 v0, 0x1

    .line 66
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->j1(Z)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/widget/w0$a;->g:Lcom/android/launcher3/widget/C;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->j:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/ComponentsFullSheet;->setChildSheet(Lcom/android/launcher3/widget/o;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
