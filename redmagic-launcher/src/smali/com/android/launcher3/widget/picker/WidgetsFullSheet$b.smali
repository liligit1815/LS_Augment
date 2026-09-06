.class Lcom/android/launcher3/widget/picker/WidgetsFullSheet$b;
.super Ljava/lang/Object;
.source "WidgetsFullSheet.java"

# interfaces
.implements Lcom/android/launcher3/widget/picker/search/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->S1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->m1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/v;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ln2/c;->e()Lo2/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lo2/a;->c()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getWidgetsToDisplay()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method
