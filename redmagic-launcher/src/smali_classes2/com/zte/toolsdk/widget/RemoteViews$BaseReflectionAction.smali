.class abstract Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "BaseReflectionAction"
.end annotation


# static fields
.field static final BITMAP:I = 0xc

.field static final BLEND_MODE:I = 0x11

.field static final BOOLEAN:I = 0x1

.field static final BUNDLE:I = 0xd

.field static final BYTE:I = 0x2

.field static final CHAR:I = 0x8

.field static final CHAR_SEQUENCE:I = 0xa

.field static final COLOR_STATE_LIST:I = 0xf

.field static final DOUBLE:I = 0x7

.field static final FLOAT:I = 0x6

.field static final ICON:I = 0x10

.field static final INT:I = 0x4

.field static final INTENT:I = 0xe

.field static final LONG:I = 0x5

.field static final SHORT:I = 0x3

.field static final STRING:I = 0x9

.field static final URI:I = 0xb

.field static final VOID:I = 0x12


# instance fields
.field mMethodName:Ljava/lang/String;

.field mType:I


# direct methods
.method constructor <init>(ILjava/lang/String;I)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;

    .line 4
    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 7
    :try_start_0
    const-string v0, "android.os.Parcel"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 8
    const-string v1, "readString8"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 9
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BaseReflectionAction from parcel error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RemoteViews"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    return-void
.end method


# virtual methods
.method public final apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 2

    .line 1
    const-string p2, "RemoteViews"

    .line 2
    .line 3
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 4
    .line 5
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 13
    .line 14
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews;->R(I)Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->getParameterValue(Landroid/view/View;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :try_start_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p1, p0, p3, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->O(Landroid/view/View;Ljava/lang/String;Ljava/lang/Class;Z)Ljava/lang/reflect/Method;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p3, "BaseReflectionAction method1 "

    .line 32
    .line 33
    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    const/4 p3, 0x1

    .line 37
    invoke-virtual {p0, p3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 38
    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const-string p3, "BaseReflectionAction method2 "

    .line 43
    .line 44
    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string p3, "BaseReflectionAction method3 "

    .line 56
    .line 57
    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    new-array p2, v1, [Ljava/lang/Object;

    .line 61
    .line 62
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    return-void

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    throw p1
.end method

.method protected abstract getParameterValue(Landroid/view/View;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public final getUniqueKey()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getUniqueKey()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 4

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 15
    .line 16
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews;->R(I)Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    if-eqz p3, :cond_8

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->getParameterValue(Landroid/view/View;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :try_start_0
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-static {p2, v1, p3, v2}, Lcom/zte/toolsdk/widget/RemoteViews;->O(Landroid/view/View;Ljava/lang/String;Ljava/lang/Class;Z)Ljava/lang/reflect/Method;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    if-eqz p3, :cond_1

    .line 34
    .line 35
    invoke-virtual {p3, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    instance-of v1, v0, Landroid/graphics/Bitmap;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    move-object v1, v0

    .line 43
    check-cast v1, Landroid/graphics/Bitmap;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 46
    .line 47
    .line 48
    :cond_2
    instance-of v1, v0, Landroid/graphics/drawable/Icon;

    .line 49
    .line 50
    if-eqz v1, :cond_4

    .line 51
    .line 52
    move-object v1, v0

    .line 53
    check-cast v1, Landroid/graphics/drawable/Icon;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/graphics/drawable/Icon;->getType()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eq v3, v2, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/graphics/drawable/Icon;->getType()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/4 v3, 0x5

    .line 66
    if-ne v2, v3, :cond_4

    .line 67
    .line 68
    :cond_3
    invoke-virtual {v1}, Landroid/graphics/drawable/Icon;->getBitmap()Landroid/graphics/Bitmap;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 75
    .line 76
    .line 77
    :cond_4
    if-eqz p3, :cond_7

    .line 78
    .line 79
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p3, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    check-cast p2, Ljava/lang/Runnable;

    .line 88
    .line 89
    if-nez p2, :cond_5

    .line 90
    .line 91
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_5
    instance-of p3, p2, Landroid/view/ViewStub$ViewReplaceRunnable;

    .line 97
    .line 98
    if-eqz p3, :cond_6

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->createTree()V

    .line 101
    .line 102
    .line 103
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 104
    .line 105
    invoke-virtual {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeById(I)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    move-object p1, p2

    .line 110
    check-cast p1, Landroid/view/ViewStub$ViewReplaceRunnable;

    .line 111
    .line 112
    iget-object p1, p1, Landroid/view/ViewStub$ViewReplaceRunnable;->view:Landroid/view/View;

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->replaceView(Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    :cond_6
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$RunnableAction;

    .line 118
    .line 119
    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RunnableAction;-><init>(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    .line 121
    .line 122
    :cond_7
    return-object p0

    .line 123
    :catchall_0
    move-exception p0

    .line 124
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 125
    .line 126
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    throw p1

    .line 130
    :cond_8
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 131
    .line 132
    new-instance p2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    const-string p3, "bad type: "

    .line 138
    .line 139
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 143
    .line 144
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw p1
.end method

.method public final mergeBehavior()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "smoothScrollBy"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final prefersAsyncApply()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 2
    .line 3
    const/16 v0, 0xb

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public visitUris(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/16 v1, 0x10

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0, v2}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->getParameterValue(Landroid/view/View;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/graphics/drawable/Icon;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0, v2}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->getParameterValue(Landroid/view/View;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Landroid/net/Uri;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string p2, "android.os.Parcel"

    .line 7
    .line 8
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const-string v0, "writeString8"

    .line 13
    .line 14
    const-class v1, Ljava/lang/String;

    .line 15
    .line 16
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p2, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mMethodName:Ljava/lang/String;

    .line 25
    .line 26
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p2, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v1, "BaseReflectionAction writeToParcel error: "

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string v0, "RemoteViews"

    .line 57
    .line 58
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    :goto_0
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
