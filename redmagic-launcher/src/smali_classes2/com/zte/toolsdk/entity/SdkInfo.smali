.class public Lcom/zte/toolsdk/entity/SdkInfo;
.super Ljava/lang/Object;
.source "SdkInfo.java"


# instance fields
.field private executor:Ljava/lang/String;
    .annotation runtime LB3/c;
        value = "executor"
    .end annotation
.end field

.field private implement:Ljava/lang/String;
    .annotation runtime LB3/c;
        value = "implement"
    .end annotation
.end field


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
.method public getExecutor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/entity/SdkInfo;->executor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImplement()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/entity/SdkInfo;->implement:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
