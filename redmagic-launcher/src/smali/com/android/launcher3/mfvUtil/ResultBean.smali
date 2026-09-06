.class public Lcom/android/launcher3/mfvUtil/ResultBean;
.super Ljava/lang/Object;
.source "ResultBean.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/mfvUtil/ResultBean$AppBean;
    }
.end annotation


# instance fields
.field private code:I

.field private data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/mfvUtil/ResultBean$AppBean;",
            ">;"
        }
    .end annotation
.end field

.field private msg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/mfvUtil/ResultBean;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/mfvUtil/ResultBean$AppBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/ResultBean;->data:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMsg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/ResultBean;->msg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/ResultBean;->code:I

    .line 2
    .line 3
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/mfvUtil/ResultBean$AppBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/ResultBean;->data:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/ResultBean;->msg:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
