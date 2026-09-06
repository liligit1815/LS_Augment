.class public Lcom/zte/mifavor/widget/GregorianLunarDateView$c;
.super Ljava/lang/Object;
.source "GregorianLunarDateView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/GregorianLunarDateView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:Lcom/zte/mifavor/widget/e;


# direct methods
.method public constructor <init>(IIIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->b:I

    .line 5
    .line 6
    iput p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->c:I

    .line 7
    .line 8
    iput p3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->d:I

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->a:Z

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->b()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private b()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Lcom/zte/mifavor/widget/e;

    .line 7
    .line 8
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->b:I

    .line 9
    .line 10
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->c:I

    .line 11
    .line 12
    sub-int/2addr v3, v1

    .line 13
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->d:I

    .line 14
    .line 15
    invoke-direct {v0, v2, v3, v1}, Lcom/zte/mifavor/widget/e;-><init>(III)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->e:Lcom/zte/mifavor/widget/e;

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->b:I

    .line 22
    .line 23
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->c:I

    .line 24
    .line 25
    invoke-static {v2, v0}, Lcom/zte/mifavor/widget/s;->c(II)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->d:I

    .line 30
    .line 31
    new-instance v4, Lcom/zte/mifavor/widget/e;

    .line 32
    .line 33
    invoke-direct {v4, v1, v0, v2, v3}, Lcom/zte/mifavor/widget/e;-><init>(ZIII)V

    .line 34
    .line 35
    .line 36
    iput-object v4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->e:Lcom/zte/mifavor/widget/e;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a()Ljava/util/Calendar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->e:Lcom/zte/mifavor/widget/e;

    .line 2
    .line 3
    return-object p0
.end method
