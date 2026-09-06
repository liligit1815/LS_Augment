.class Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MethodKey"
.end annotation


# instance fields
.field public methodName:Ljava/lang/String;

.field public paramClass:Ljava/lang/Class;

.field public targetClass:Ljava/lang/Class;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->targetClass:Ljava/lang/Class;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->targetClass:Ljava/lang/Class;

    .line 12
    .line 13
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->paramClass:Ljava/lang/Class;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->paramClass:Ljava/lang/Class;

    .line 22
    .line 23
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p1, p1, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->methodName:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->methodName:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->targetClass:Ljava/lang/Class;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->paramClass:Ljava/lang/Class;

    .line 8
    .line 9
    invoke-static {v1}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/2addr v0, v1

    .line 14
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->methodName:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    xor-int/2addr p0, v0

    .line 21
    return p0
.end method

.method public set(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->targetClass:Ljava/lang/Class;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->paramClass:Ljava/lang/Class;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->methodName:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
