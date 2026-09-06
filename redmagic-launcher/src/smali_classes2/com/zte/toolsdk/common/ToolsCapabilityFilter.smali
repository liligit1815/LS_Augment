.class public Lcom/zte/toolsdk/common/ToolsCapabilityFilter;
.super Ljava/lang/Object;
.source "ToolsCapabilityFilter.java"


# instance fields
.field function_name:Ljava/lang/String;

.field language:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field package_name:Ljava/lang/String;

.field region:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field role:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;->package_name:Ljava/lang/String;

    .line 4
    iput-object p2, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;->function_name:Ljava/lang/String;

    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;->role:Ljava/lang/String;

    .line 6
    iput-object p4, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;->region:Ljava/util/List;

    .line 7
    iput-object p5, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;->language:Ljava/util/List;

    return-void
.end method
