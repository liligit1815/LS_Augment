.class Landroidx/appcompat/widget/A$h$a;
.super Ljava/lang/Object;
.source "AppCompatSpinner.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/A$h;-><init>(Landroidx/appcompat/widget/A;Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/widget/A;

.field final synthetic h:Landroidx/appcompat/widget/A$h;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/A$h;Landroidx/appcompat/widget/A;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/A$h$a;->h:Landroidx/appcompat/widget/A$h;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/appcompat/widget/A$h$a;->g:Landroidx/appcompat/widget/A;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/A$h$a;->h:Landroidx/appcompat/widget/A$h;

    .line 2
    .line 3
    iget-object p1, p1, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 4
    .line 5
    invoke-virtual {p1, p3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Landroidx/appcompat/widget/A$h$a;->h:Landroidx/appcompat/widget/A$h;

    .line 9
    .line 10
    iget-object p1, p1, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/widget/Spinner;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Landroidx/appcompat/widget/A$h$a;->h:Landroidx/appcompat/widget/A$h;

    .line 19
    .line 20
    iget-object p4, p1, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 21
    .line 22
    iget-object p1, p1, Landroidx/appcompat/widget/A$h;->N:Landroid/widget/ListAdapter;

    .line 23
    .line 24
    invoke-interface {p1, p3}, Landroid/widget/ListAdapter;->getItemId(I)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    invoke-virtual {p4, p2, p3, v0, v1}, Landroid/widget/Spinner;->performItemClick(Landroid/view/View;IJ)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/A$h$a;->h:Landroidx/appcompat/widget/A$h;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->dismiss()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
