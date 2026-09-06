.class Lcom/android/launcher3/cloudfolder/RemoteView$e;
.super Ljava/lang/Object;
.source "RemoteView.java"

# interfaces
.implements Landroid/view/LayoutInflater$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/cloudfolder/RemoteView;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$e;->g:Lcom/android/launcher3/cloudfolder/RemoteView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;Ld1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$e;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;)V

    return-void
.end method


# virtual methods
.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onCreateView name:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "RemoteView"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    const/16 v1, 0x2e

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ltz v1, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$e;->g:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    if-eqz p2, :cond_2

    .line 41
    .line 42
    sget-object v1, Lcom/android/launcher3/cloudfolder/RemoteView;->l:[Ljava/lang/String;

    .line 43
    .line 44
    array-length v2, v1

    .line 45
    const/4 v3, 0x0

    .line 46
    :goto_0
    if-ge v3, v2, :cond_1

    .line 47
    .line 48
    aget-object v4, v1, v3

    .line 49
    .line 50
    if-eqz v4, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_0

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$e;->g:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 65
    .line 66
    invoke-virtual {v1, p1, v0, v0}, Landroid/view/LayoutInflater;->createView(Ljava/lang/String;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$e;->g:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 71
    .line 72
    new-instance v1, Landroid/widget/FrameLayout;

    .line 73
    .line 74
    invoke-direct {v1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p0, v1, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->f(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/widget/FrameLayout;Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    .line 80
    return-object p1

    .line 81
    :catch_0
    move-exception p0

    .line 82
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 83
    .line 84
    .line 85
    :cond_2
    :goto_1
    return-object v0
.end method
