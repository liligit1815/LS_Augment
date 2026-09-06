.class Lcom/zte/mifavor/widget/GregorianLunarDateView$b;
.super Ljava/lang/Object;
.source "GregorianLunarDateView.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/GregorianLunarDateView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/GregorianLunarDateView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/GregorianLunarDateView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$b;->a:Lcom/zte/mifavor/widget/GregorianLunarDateView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$b;->a:Lcom/zte/mifavor/widget/GregorianLunarDateView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->e(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$b;->a:Lcom/zte/mifavor/widget/GregorianLunarDateView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->d(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$b;->a:Lcom/zte/mifavor/widget/GregorianLunarDateView;

    .line 22
    .line 23
    xor-int/lit8 p1, p2, 0x1

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->setGregorian(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
